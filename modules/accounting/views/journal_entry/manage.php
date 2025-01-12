<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<?php init_head();?>
<div id="wrapper">
  <div class="content">
    <div class="row">
      <div class="panel_s">
        <div class="panel-body">
        <p class="tw-font-semibold tw-flex tw-items-center tw-mb-0 tw-space-x-1.5 rtl:tw-space-x-reverse">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                stroke="currentColor" class="tw-w-6 tw-h-6 tw-text-neutral-500">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M7.5 3.75h9m-9 3h9m-9 3h6m-6 3h9m-9 3h4.5m-6 3h12a2.25 2.25 0 002.25-2.25V5.25A2.25 2.25 0 0019.5 3H4.5a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 004.5 21z" />
                            </svg>

                            <span class="tw-text-neutral-700">
                            <?php echo _l($title); ?>
                            </span>
          </p>
         
          <hr />
          <div>
          <a href="<?php echo admin_url('accounting/new_journal_entry'); ?>"
                            class="btn btn-primary">
                            <i class="fa-regular fa-plus tw-mr-1"></i>
                           New journal entry
          </a>
           
          </div>
          <div class="row">
            <div class="col-md-3">
              <?php echo render_date_input('from_date','from_date'); ?>
            </div>
            <div class="col-md-3">
              <?php echo render_date_input('to_date','to_date'); ?>
            </div>
          </div>
          <a href="#" data-toggle="modal" data-target="#journal_entry_bulk_actions" class="hide bulk-actions-btn table-btn" data-table=".table-journal-entry"><?php echo _l('bulk_actions'); ?></a>
          <table class="table table-journal-entry scroll-responsive">
           <thead>
              <tr>
                <th><span class="hide"> - </span><div class="checkbox mass_select_all_wrap"><input type="checkbox" id="mass_select_all" data-to-table="journal-entry"><label></label></div></th>
                 <th><?php echo _l('journal_date'); ?></th>
                 <th><?php echo _l('number').' - '._l('description'); ?></th>
                 <th><?php echo _l('acc_amount'); ?></th>
              </tr>
           </thead>
        </table>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal fade bulk_actions" id="journal_entry_bulk_actions" tabindex="-1" role="dialog" data-table=".table-journal-entry">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title"><?php echo _l('bulk_actions'); ?></h4>
         </div>
         <div class="modal-body">
            <?php if(has_permission('accounting_journal_entry','','detele')){ ?>
               <div class="checkbox checkbox-danger">
                  <input type="checkbox" name="mass_delete" id="mass_delete">
                  <label for="mass_delete"><?php echo _l('mass_delete'); ?></label>
               </div>
            <?php } ?>
      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo _l('close'); ?></button>
         <a href="#" class="btn btn-info" onclick="bulk_action(this); return false;"><?php echo _l('confirm'); ?></a>
      </div>
   </div>
   <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<?php init_tail(); ?>
</body>
</html>
