<?php

defined('BASEPATH') or exit('No direct script access allowed');

$dimensions = $pdf->getPageDimensions();

// Get the logo URL using pdf_logo_url()
$logo_url = logo_url();

$info_left_column  = '';

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

// Get Y position for the separation
$y = $pdf->getY();

$company_info = '<div style="color:#424242;">';
$company_info .= format_organization_info();
$company_info .= '</div>';

// Add logo
$info_left_column .= pdf_logo_url();

// Bill to
$client_details = format_customer_info($payment->invoice_data, 'payment', 'billing');

$left_info  = $swap == '1' ? $info_left_column : $company_info;
$right_info = $swap == '1' ? $company_info : $info_left_column;

pdf_multi_row($left_info, $right_info, $pdf, ($dimensions['wk'] / 2) - $dimensions['lm']);

// Add a horizontal line below the two columns (spanning full width)
$pdf->SetY($pdf->GetY() + 5); // Adjust vertical position
$pdf->SetLineWidth(0.3); // Line thickness
$A4_width = 199;

// Set the color for the line (e.g., red color: RGB(255, 0, 0))
$pdf->SetDrawColor(224,224,224); // Red color (RGB)
// Draw the horizontal line, respecting the left and right margins
$pdf->Line($pdf->GetX(), $pdf->GetY(), $A4_width , $pdf->GetY());

$pdf->ln(2);

// New section body

$pdf->setFillColor([209, 213, 219]);
$pdf->SetFontSize(15);

$receipt_heading = '<div style="font-weight: bold;">' . mb_strtoupper(_l('payment_receipt'), 'UTF-8') . '</div>';

$left_col = '<div style="font-size: 16px; font-weight: bold;">' . _l('Bill to') . '</div>';
$left_col .= '<div style="font-size: 16px;">' . $client_details . '</div>';

$right_col = $receipt_heading;
$right_col .= '<br><br><span style="font-size: 16px;">' . _l('payment_date') . ' ' . _d($payment->date) . '</span>';


$payment_name = $payment->name;
if (!empty($payment->paymentmethod)) {
    $payment_name .= ' - ' . $payment->paymentmethod;
}
$right_col .= '<br><span style="font-size: 16px;">' . _l('payment_view_mode') . ' ' . $payment_name . '</span>';

if (!empty($payment->transactionid)) {
    $right_col .= '<br><span style="font-size: 16px;">' . _l('payment_transaction_id') . ': ' . $payment->transactionid . '</span>';
}

pdf_multi_row($left_col, $right_col, $pdf, ($dimensions['wk'] / 2) - $dimensions['lm']);

$pdf->Ln(2);
$pdf->Line($pdf->getX(), $pdf->getY(), 200, $pdf->getY());
$pdf->Ln(2);
$pdf->RoundedRect($pdf->getX(), $pdf->getY(), 190, 20, 1, '1111', 'FD', ['color' => [0, 0, 0]], [243, 244, 246]);
$pdf->Ln(0.5);
$pdf->SetFont($font_name, '', 11);
$pdf->Cell(80, 8, '   ' . 'Amount received', 0, 1, 'L', '0', '', 0, true, 'T', 'B');
$pdf->SetFont($font_name, 'B', 11);
$pdf->Cell(80, 11, '   ' . app_format_money($payment->amount, $payment->invoice_data->currency_name), 0, 1, 'L', '0');

$pdf->Ln(5);
$pdf->SetTextColor(0);
$pdf->SetFont($font_name, 'B', 10);
$pdf->Cell(0, 0, _l('payment_for_string'), 0, 1, 'L', 0, '', 0);
$pdf->SetFont($font_name, '', $font_size);
$pdf->Ln(1);

// Header
$tblhtml = '<table border="1" width="100%" bgcolor="#fff" cellspacing="0" cellpadding="5">
<tr height="30" style="color:#030712; font-weight: bold;"  bgcolor="rgb(243, 244, 246)">
    <th width="' . ($amountDue ? 20 : 25) . '%;">' . _l('payment_table_invoice_number') . '</th>
    <th width="' . ($amountDue ? 20 : 25) . '%;">' . _l('payment_table_invoice_date') . '</th>
    <th width="' . ($amountDue ? 20 : 25) . '%;">' . _l('payment_table_invoice_amount_total') . '</th>
    <th width="' . ($amountDue ? 20 : 25) . '%;">' . _l('payment_table_payment_amount_total') . '</th>';

if ($amountDue) {
    $tblhtml .= '<th width="20%">' . _l('invoice_amount_due') . '</th>';
}

$tblhtml .= '</tr>';

$tblhtml .= '<tbody>';
$tblhtml .= '<tr>';
$tblhtml .= '<td>' . format_invoice_number($payment->invoice_data->id) . '</td>';
$tblhtml .= '<td>' . _d($payment->invoice_data->date) . '</td>';
$tblhtml .= '<td>' . app_format_money($payment->invoice_data->total, $payment->invoice_data->currency_name) . '</td>';
$tblhtml .= '<td>' . app_format_money($payment->amount, $payment->invoice_data->currency_name) . '</td>';
if ($amountDue) {
    $tblhtml .= '<td style="color:#fc2d42">' . app_format_money($payment->invoice_data->total_left_to_pay, $payment->invoice_data->currency_name) . '</td>';
}
$tblhtml .= '</tr>';
$tblhtml .= '</tbody>';
$tblhtml .= '</table>';
$pdf->writeHTML($tblhtml, true, false, false, false, '');
