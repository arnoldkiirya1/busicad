<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<?php $isRTL = (is_rtl() ? 'true' : 'false'); ?>

<!DOCTYPE html>
<html lang="<?= e($locale); ?>"
    dir="<?= ($isRTL == 'true') ? 'rtl' : 'ltr' ?>">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <title>
        <?= $title ?? get_option('companyname'); ?>
    </title>

    <?= app_compile_css(); ?>

    <style>
        /* Add border to all cells */
        .page-sizef {
            padding: 0cm;
            border: 1px #D3D3D3 solid;
            border-radius: 0px;
            background: white;
            display: flex;
            margin: 0cm 0cm !important;
        }

        .tree {
            width: 100%;
            border-collapse: collapse;
            margin: 0 0 !important;
            font-size: 14px;
            text-align: left;
        }

        /* General Table Styling */
        .tree th, .tree td {
        padding: 6px 7px;
        border: 1px solid #ddd;
        }

        /* Header Styling */
        .tree th {
        background-color: #455A64;
        color: #fff;
        font-weight: bold;
        text-align: center;
        }

        /* Row Colors */
        .tree tr:nth-child(even) {
        background-color: #f9f9f9;
        }

        .tree tr:hover {
        background-color: #f1f1f1;
        }

        /* Parent Node Styling */
        .tree .parent {
        font-weight: bold;
        background-color: #e8f0fe;
        }

        /* Totals Row Styling */
        .tr_total td {
        font-weight: bold;
        background-color: #f2ffe6;
        }

        /* Text Alignments */
        .text-center {
        text-align: center;
        }

        .text-bold {
        font-weight: bold;
        }

        .no-margin-top-20 {
        margin-top: 0;
        }

        .no-margin-left-24 {
        margin-left: 0;
        }

        /* Responsive Design */
        @media screen and (max-width: 768px) {
        .tree {
            font-size: 14px;
        }

        .tree th, .tree td {
            padding: 8px 10px;
        }
        }

    </style>

    <?php render_admin_js_variables(); ?>

    <script>
        var totalUnreadNotifications = <?= e($current_user->total_unread_notifications); ?> ,
            proposalsTemplates = <?= json_encode(get_proposal_templates()); ?> ,
            contractsTemplates = <?= json_encode(get_contract_templates()); ?> ,
            billingAndShippingFields = ['billing_street', 'billing_city', 'billing_state', 'billing_zip',
                'billing_country',
                'shipping_street', 'shipping_city', 'shipping_state', 'shipping_zip', 'shipping_country'
            ],
            isRTL = '<?= e($isRTL); ?>',
            taskid, taskTrackingStatsData, taskAttachmentDropzone, taskCommentAttachmentDropzone, newsFeedDropzone,
            expensePreviewDropzone, taskTrackingChart, cfh_popover_templates = {},
            _table_api;
    </script>
    <?php app_admin_head(); ?>
    
</head>

<body <?= admin_body_class($bodyclass ?? ''); ?>>
    <?php hooks()->do_action('after_body_start'); ?>