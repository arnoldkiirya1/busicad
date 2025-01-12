

<div class="widget" id="widget-<?php echo basename(__FILE__,".php"); ?>" data-name="<?php echo _l('purchase_widget'); ?>">
<div class="panel_s user-data">
  <div class="panel-body">
    <div class="widget-dragger"></div>

      <div class="row">
       <div class="col-md-12">
          <div class="row">
            <div class="col-md-6">
            <p class="tw-font-semibold tw-flex tw-items-center tw-mb-0 tw-space-x-1.5 rtl:tw-space-x-reverse">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                stroke="currentColor" class="tw-w-6 tw-h-6 tw-text-neutral-500">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M10.125 2.25h-4.5c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125v-9M10.125 2.25h.375a9 9 0 019 9v.375M10.125 2.25A3.375 3.375 0 0113.5 5.625v1.5c0 .621.504 1.125 1.125 1.125h1.5a3.375 3.375 0 013.375 3.375M9 15l2.25 2.25L15 12" />
                            </svg>

                            <span class="tw-text-neutral-700">
                               Purchase Orders
                            </span>
              </p>
              <!-- <h4 class="no-margin font-bold"><i class="fa fa-shopping-cart" aria-hidden="true"></i> <?php echo _l('orders_are_about_to_be_delivered'); ?></h4> -->
            </div>
            <div class="col-md-6">
              <a href="<?php echo admin_url('purchase/purchase_order'); ?>" class="btn btn-info pull-right"><?php echo _l('view_all'); ?></a>
            </div>
          </div>
          <hr />
        </div>
                </div>
                 <?php 
                 $arr_table = [];
                 $arr_table[] = _l('pur_order_number');
                 $arr_table[] = _l('order_date');
                 $arr_table[] = _l('vendor');
                 $arr_table[] = _l('po_value');
                 $arr_table[] = _l('tax_value');
                 $arr_table[] = _l('delivery_date');
                 $arr_table[] = _l('delivery_status');
                    
                  ?>                   
                <?php render_datatable($arr_table,'table_purorder_wg'); ?>                   
      
    </div>
  </div>
   
</div>