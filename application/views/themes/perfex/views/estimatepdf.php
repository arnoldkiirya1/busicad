<?php

defined('BASEPATH') or exit('No direct script access allowed');

$dimensions = $pdf->getPageDimensions();

// Get the logo URL using pdf_logo_url()
// Get the logo URL using pdf_logo_url()
$logo_url = logo_url();

// If the logo exists, render it
if (!empty($logo_url)) {
    // Get the image size (original width and height)
    list($orig_width, $orig_height) = getimagesize($logo_url);

    // Define the maximum width you want for the logo
    $max_width = 100; // 100mm width for the logo

    // Calculate the new dimensions while maintaining the aspect ratio
    $aspect_ratio = $orig_width / $orig_height;
    $image_width = $max_width;
    $image_height = $max_width / $aspect_ratio;

    // Position the image in the center of the page
    $x = (210 - $image_width) / 2;
    $y = (297 - $image_height) / 2;

    // Set transparency (watermark effect)
    $pdf->SetAlpha(0.1); // Set alpha for transparency (0.1 is very transparent)

    // Render the image at the center with the calculated width and height
    $pdf->Image($logo_url, $x, $y, $image_width, $image_height);

    // Reset alpha back to full opacity
    $pdf->SetAlpha(1); // Reset to no transparency
}

$info_right_column = '';
$info_left_column  = '';

$info_right_column .= '<span style="font-weight:bold;font-size:22px;">' . _l('estimate_pdf_heading') . '</span><br />';
$info_right_column .= '<b style="color:#4e4e4e;"># ' . $estimate_number . '</b>';


$organization_info = '<div style="color:#424242;">';
$organization_info .= format_organization_info();
$organization_info .= '</div>';


if (get_option('show_status_on_pdf_ei') == 1) {
    $info_right_column .= '<br /><span style="color:rgb(' . estimate_status_color_pdf($status) . ');text-transform:uppercase;">' . format_estimate_status($status, '', false) . '</span>';
}

// Add logo
$info_left_column .= pdf_logo_url();

$organization_info = hooks()->apply_filters('estimatepdf_organization_info', $organization_info, $estimate);


// Write top left logo and right column info/text
pdf_multi_row($info_left_column, $organization_info, $pdf, ($dimensions['wk'] / 2) - $dimensions['lm']);

// Add a horizontal line below the two columns (spanning full width)
$pdf->SetY($pdf->GetY() + 5); // Adjust vertical position
$pdf->SetLineWidth(0.3); // Line thickness
$A4_width = 199;

// Set the color for the line (e.g., red color: RGB(255, 0, 0))
$pdf->SetDrawColor(224,224,224); // Red color (RGB)
// Draw the horizontal line, respecting the left and right margins
$pdf->Line($pdf->GetX(), $pdf->GetY(), $A4_width , $pdf->GetY());

$pdf->ln(5);

// Estimate to
$estimate_info = '<b>' . _l('estimate_to') . '</b>';
$estimate_info .= '<div style="color:#424242;">';
$estimate_info .= format_customer_info($estimate, 'estimate', 'billing');
$estimate_info .= '</div>';

// ship to to
if ($estimate->include_shipping == 1 && $estimate->show_shipping_on_estimate == 1) {
    $estimate_info .= '<br /><b>' . _l('ship_to') . '</b>';
    $estimate_info .= '<div style="color:#424242;">';
    $estimate_info .= format_customer_info($estimate, 'estimate', 'shipping');
    if (! empty($estimate->reference_no)) {
        $estimate_info .= _l('reference_no') . ': ' . $estimate->reference_no . '<br/>';
    }
    $estimate_info .= '</div>';
}

$info_right_column .= '<br />' . _l('estimate_data_date') . ': ' . _d($estimate->date) . '<br />';

if (! empty($estimate->expirydate)) {
    $info_right_column .= _l('estimate_data_expiry_date') . ': ' . _d($estimate->expirydate) . '<br />';
}

if ($estimate->sale_agent && get_option('show_sale_agent_on_estimates') == 1) {
    $info_right_column .= _l('sale_agent_string') . ': ' . get_staff_full_name($estimate->sale_agent) . '<br />';
}

if ($estimate->project_id && get_option('show_project_on_estimate') == 1) {
    $estimate_info .= _l('project') . ': ' . get_project_name_by_id($estimate->project_id) . '<br />';
}

foreach ($pdf_custom_fields as $field) {
    $value = get_custom_field_value($estimate->id, $field['id'], 'estimate');
    if ($value == '') {
        continue;
    }
    $estimate_info .= $field['name'] . ': ' . $value . '<br />';
}

$left_info  = $swap == '1' ? $estimate_info : $info_right_column;
$right_info = $swap == '1' ? $info_right_column : $estimate_info;

pdf_multi_row($left_info, $right_info, $pdf, ($dimensions['wk'] / 2) - $dimensions['lm']);

// The Table
$pdf->Ln(hooks()->apply_filters('pdf_info_and_table_separator', 0));

// The items table
$items = get_items_table_data($estimate, 'estimate', 'pdf');

$tblhtml = $items->table();

// Modify the table to include inline CSS styles
$tblhtml = '<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        border: 1.5px solid #424242;
        padding: 2px;
    }
    th {
        font-weight: bold;
    }
</style>' . $tblhtml;

$pdf->writeHTML($tblhtml, true, false, false, false, '');

$pdf->Ln(0);
$tbltotal = '';
$tbltotal .= '<table border="1" cellpadding="6" style="font-size:' . ($font_size + 4) . 'px">';
$tbltotal .= '
<tr>
    <td align="right" width="85%"><strong>' . _l('estimate_subtotal') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($estimate->subtotal, $estimate->currency_name) . '</td>
</tr>';

if (is_sale_discount_applied($estimate)) {
    $tbltotal .= '
    <tr>
        <td align="right" width="85%"><strong>' . _l('estimate_discount');
    if (is_sale_discount($estimate, 'percent')) {
        $tbltotal .= ' (' . app_format_number($estimate->discount_percent, true) . '%)';
    }
    $tbltotal .= '</strong>';
    $tbltotal .= '</td>';
    $tbltotal .= '<td align="right" width="15%">-' . app_format_money($estimate->discount_total, $estimate->currency_name) . '</td>
    </tr>';
}

foreach ($items->taxes() as $tax) {
    $tbltotal .= '<tr>
    <td align="right" width="85%"><strong>' . $tax['taxname'] . ' (' . app_format_number($tax['taxrate']) . '%)' . '</strong></td>
    <td align="right" width="15%">' . app_format_money($tax['total_tax'], $estimate->currency_name) . '</td>
</tr>';
}

if ((int) $estimate->adjustment != 0) {
    $tbltotal .= '<tr>
    <td align="right" width="85%"><strong>' . _l('estimate_adjustment') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($estimate->adjustment, $estimate->currency_name) . '</td>
</tr>';
}

$tbltotal .= '
<tr style="background-color:#f0f0f0;">
    <td align="right" width="85%"><strong>' . _l('estimate_total') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($estimate->total, $estimate->currency_name) . '</td>
</tr>';

$tbltotal .= '</table>';

$pdf->writeHTML($tbltotal, true, false, false, false, '');

if (get_option('total_to_words_enabled') == 1) {
    // Set the font bold
    $pdf->SetFont($font_name, 'B', $font_size);
    $pdf->writeHTMLCell('', '', '', '', _l('num_word') . ': ' . $CI->numberword->convert($estimate->total, $estimate->currency_name), 0, 1, false, true, 'C', true);
    // Set the font again to normal like the rest of the pdf
    $pdf->SetFont($font_name, '', $font_size);
    $pdf->Ln(4);
}

// Add a horizontal line below the two columns (spanning full width)
$pdf->SetY($pdf->GetY() + 5); // Adjust vertical position
$pdf->SetLineWidth(0.3); // Line thickness
$A4_width = 199;

// Set the color for the line (e.g., red color: RGB(255, 0, 0))
$pdf->SetDrawColor(224,224,224); // Red color (RGB)
// Draw the horizontal line, respecting the left and right margins
$pdf->Line($pdf->GetX(), $pdf->GetY(), $A4_width , $pdf->GetY());

if (! empty($estimate->clientnote)) {
    $pdf->Ln(4);
    $pdf->SetFont($font_name, 'B', $font_size);
    $pdf->Cell(0, 0, _l('estimate_note'), 0, 1, 'L', 0, '', 0);
    $pdf->SetFont($font_name, '', $font_size);
    $pdf->Ln(2);
    $pdf->writeHTMLCell('', '', '', '', $estimate->clientnote, 0, 1, false, true, 'L', true);
}

if (! empty($estimate->terms)) {
    $pdf->Ln(4);
    $pdf->SetFont($font_name, 'B', $font_size);
    $pdf->Cell(0, 0, _l('terms_and_conditions') . ':', 0, 1, 'L', 0, '', 0);
    $pdf->SetFont($font_name, '', $font_size);
    $pdf->Ln(2);
    $pdf->writeHTMLCell('', '', '', '', $estimate->terms, 0, 1, false, true, 'L', true);
}

// Add a horizontal line below the two columns (spanning full width)
$pdf->SetY($pdf->GetY() + 5); // Adjust vertical position
$pdf->SetLineWidth(0.3); // Line thickness
$A4_width = 199;

// Set the color for the line (e.g., red color: RGB(255, 0, 0))
$pdf->SetDrawColor(224,224,224); // Red color (RGB)
// Draw the horizontal line, respecting the left and right margins
$pdf->Line($pdf->GetX(), $pdf->GetY(), $A4_width , $pdf->GetY());
$pdf->ln(5);


