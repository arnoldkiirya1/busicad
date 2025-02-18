<?php

defined('BASEPATH') or exit('No direct script access allowed');
$dimensions = $pdf->getPageDimensions();

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
    $y = 50;

    // Set transparency (watermark effect)
    $pdf->SetAlpha(0.1); // Set alpha for transparency (0.1 is very transparent)

    // Render the image at the center with the calculated width and height
    $pdf->Image($logo_url, $x, $y, $image_width, $image_height);

    // Reset alpha back to full opacity
    $pdf->SetAlpha(1); // Reset to no transparency
}

$pdf_logo_url = pdf_logo_url();

$proposal_info = '<div style="color:#424242;">';
$proposal_info .= format_organization_info();
$proposal_info .= '</div>';

// Write top left logo and right column info/text
pdf_multi_row($pdf_logo_url, $proposal_info, $pdf, ($dimensions['wk'] / 2) - $dimensions['lm']);

// Add a horizontal line below the two columns (spanning full width)
$pdf->SetY($pdf->GetY() + 5); // Adjust vertical position
$pdf->SetLineWidth(0.3); // Line thickness
$A4_width = 199;

// Set the color for the line (e.g., red color: RGB(255, 0, 0))
$pdf->SetDrawColor(224,224,224); // Red color (RGB)
// Draw the horizontal line, respecting the left and right margins
$pdf->Line($pdf->GetX(), $pdf->GetY(), $A4_width , $pdf->GetY());

// Proposal to
$client_details = '<b>' . _l('proposal_to') . '</b>';
$client_details .= '<div style="color:#424242;">';
$client_details .= format_proposal_info($proposal, 'pdf');
$client_details .= '</div>';

$pdf->writeHTMLCell(($dimensions['wk'] / 2) - $dimensions['lm'], $rowcount * 7, '', ($swap == '1' ? $y : ''), $client_details, 0, 1, false, true, ($swap == '1' ? 'J' : 'R'), true);

$pdf->ln(6);

$proposal_date = _l('proposal_date') . ': ' . _d($proposal->date);
$open_till     = '';

if (! empty($proposal->open_till)) {
    $open_till = _l('proposal_open_till') . ': ' . _d($proposal->open_till)  . '<br />';
}

$project = '';
if ($proposal->project_id != '' && get_option('show_project_on_proposal') == 1) {
    $project .=  '</b>' . _l('project') . ': ' . get_project_name_by_id($proposal->project_id) . '</b>' . '<br />';
}

$qty_heading = _l('estimate_table_quantity_heading', '', false);

if ($proposal->show_quantity_as == 2) {
    $qty_heading = _l($this->type . '_table_hours_heading', '', false);
} elseif ($proposal->show_quantity_as == 3) {
    $qty_heading = _l('estimate_table_quantity_heading', '', false) . '/' . _l('estimate_table_hours_heading', '', false);
}

// The items table
$items = get_items_table_data($proposal, 'proposal', 'pdf')
    ->set_headings('estimate');

$items_html = $items->table();

$items_html .= '<br /><br />';
$items_html .= '';
$items_html .= '<table border="1"  cellpadding="6" style="font-size:' . ($font_size + 4) . 'px">';

$items_html .= '
<tr>
    <td align="right" width="85%"><strong>' . _l('estimate_subtotal') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($proposal->subtotal, $proposal->currency_name) . '</td>
</tr>';

if (is_sale_discount_applied($proposal)) {
    $items_html .= '
    <tr>
        <td align="right" width="85%"><strong>' . _l('estimate_discount');
    if (is_sale_discount($proposal, 'percent')) {
        $items_html .= ' (' . app_format_number($proposal->discount_percent, true) . '%)';
    }
    $items_html .= '</strong>';
    $items_html .= '</td>';
    $items_html .= '<td align="right" width="15%">-' . app_format_money($proposal->discount_total, $proposal->currency_name) . '</td>
    </tr>';
}

foreach ($items->taxes() as $tax) {
    $items_html .= '<tr>
    <td align="right" width="85%"><strong>' . $tax['taxname'] . ' (' . app_format_number($tax['taxrate']) . '%)' . '</strong></td>
    <td align="right" width="15%">' . app_format_money($tax['total_tax'], $proposal->currency_name) . '</td>
</tr>';
}

if ((int) $proposal->adjustment != 0) {
    $items_html .= '<tr>
    <td align="right" width="85%"><strong>' . _l('estimate_adjustment') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($proposal->adjustment, $proposal->currency_name) . '</td>
</tr>';
}
$items_html .= '
<tr style="background-color:#f0f0f0;">
    <td align="right" width="85%"><strong>' . _l('estimate_total') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($proposal->total, $proposal->currency_name) . '</td>
</tr>';
$items_html .= '</table>';

if (get_option('total_to_words_enabled') == 1) {
    $items_html .= '<br /><br /><br />';
    $items_html .= '<strong style="text-align:center;">' . _l('num_word') . ': ' . $CI->numberword->convert($proposal->total, $proposal->currency_name) . '</strong>';
}

$proposal->content = str_replace('{proposal_items}', $items_html, $proposal->content);

// Get the proposals css
// Theese lines should aways at the end of the document left side. Dont indent these lines
$html = <<<EOF
    <p style="font-size:20px;"># {$number}
    <br /><span style="font-size:15px;">{$proposal->subject}</span>
    </p>
    {$proposal_date}
    <br />
    {$open_till}
    {$project}
    <div style="width:675px !important;">
    {$proposal->content}
    </div>
    EOF;

$pdf->writeHTML($html, true, false, true, false, '');
