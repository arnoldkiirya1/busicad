<div id="accordion">
  <div class="">
    <table class="tree" id ="report" >
      <th class="tr_header">
          <td class="text-bold"><?php echo _l('invoice_payments_table_date_heading'); ?></td>
          <td class="text-bold"><?php echo _l('transaction_type'); ?></td>
          <td class="text-bold"><?php echo _l('description'); ?></td>
          <td class="text-bold"><?php echo _l('split'); ?></td>
          <td class="total_amount text-bold"><?php echo _l('acc_amount'); ?></td>
          <td class="total_amount text-bold"><?php echo _l('balance'); ?></td>
        </th>
      <tbody>
        
        <tr class="treegrid-1000 parent-node expanded">
          <td class="parent"><?php echo _l('acc_ordinary_income_expenses'); ?></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <?php
         $row_index = 1;
         $parent_index = 1; ?>

        <tr class="treegrid-<?php echo new_html_entity_decode($row_index); ?> treegrid-parent-1000 parent-node expanded">
          <td class="parent"><?php echo _l('acc_income'); ?></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <?php
        $total_income = 0;
        $data = $this->accounting_model->get_html_profit_and_loss_detail($data_report['data']['income'], ['html' => '', 'row_index' => $row_index + 1, 'total_amount' => 0, 'total_py_amount' => 0], $parent_index, $currency);
            $row_index = $data['row_index'];
            echo new_html_entity_decode($data['html']);
            $total_income = $data['total_amount'];

         ?>
        <?php $row_index += 1; ?>
          <tr class="treegrid-total-<?php echo new_html_entity_decode($row_index); ?> treegrid-parent-<?php echo new_html_entity_decode($parent_index); ?> parent-node expanded tr_total">
            <td class="parent"><?php echo _l('total_for', _l('acc_income')); ?></td>
            <td></td>
            <td></td>
            <td></td>
            <td class="total_amount"><?php echo app_format_money($total_income, $currency->name); ?> </td>
            <td></td>
          </tr>

        <?php
         $row_index += 1;
         $parent_index = $row_index; ?>
        <tr class="treegrid-<?php echo new_html_entity_decode($row_index); ?> treegrid-parent-1000 parent-node expanded">
          <td class="parent"><?php echo _l('acc_cost_of_sales'); ?></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <?php 
          $data = $this->accounting_model->get_html_profit_and_loss_detail($data_report['data']['cost_of_sales'], ['html' => '', 'row_index' => $row_index + 1, 'total_amount' => 0, 'total_py_amount' => 0], $parent_index, $currency);
            $row_index = $data['row_index'];
            echo new_html_entity_decode($data['html']);
            $total_cost_of_sales = $data['total_amount'];
         ?>
        <?php $row_index += 1; ?>
          <tr class="treegrid-total-<?php echo new_html_entity_decode($row_index); ?> treegrid-parent-<?php echo new_html_entity_decode($parent_index); ?> parent-node expanded tr_total">
            <td class="parent"><?php echo _l('total_for', _l('acc_cost_of_sales')); ?></td>
            <td></td>
            <td></td>
            <td></td>
            <td class="total_amount"><?php echo app_format_money($total_cost_of_sales, $currency->name); ?> </td>
            <td></td>
          </tr>
        <?php $row_index += 1; ?>
        <tr class="treegrid-<?php echo new_html_entity_decode($row_index); ?> treegrid-parent-1000 parent-node expanded tr_total">
          <td class="parent"><?php echo _l('gross_profit'); ?></td>
          <td></td>
          <td></td>
          <td></td>
          <td class="total_amount"><?php echo app_format_money($total_income - $total_cost_of_sales, $currency->name); ?></td>
          <td></td>
        </tr>
        <?php
         $row_index += 1;
         $parent_index = $row_index; ?>
        <tr class="treegrid-<?php echo new_html_entity_decode($row_index); ?> treegrid-parent-1000 parent-node expanded">
          <td class="parent"><?php echo _l('acc_other_income'); ?></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <?php 
        $data = $this->accounting_model->get_html_profit_and_loss_detail($data_report['data']['other_income'], ['html' => '', 'row_index' => $row_index + 1, 'total_amount' => 0, 'total_py_amount' => 0], $parent_index, $currency);
            $row_index = $data['row_index'];
            echo new_html_entity_decode($data['html']);
            $total_other_income = $data['total_amount'];
         ?>
        <?php $row_index += 1; ?>
          <tr class="treegrid-total-<?php echo new_html_entity_decode($row_index); ?> treegrid-parent-<?php echo new_html_entity_decode($parent_index); ?> parent-node expanded tr_total">
            <td class="parent"><?php echo _l('total_for', _l('acc_other_income')); ?></td>
            <td></td>
            <td></td>
            <td></td>
            <td class="total_amount"><?php echo app_format_money($total_other_income, $currency->name); ?> </td>
            <td></td>
          </tr>
        <?php
         $row_index += 1;
         $parent_index = $row_index; ?>
        <tr class="treegrid-<?php echo new_html_entity_decode($row_index); ?> treegrid-parent-1000 parent-node expanded">
          <td class="parent"><?php echo _l('acc_expenses'); ?></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <?php 
        $data = $this->accounting_model->get_html_profit_and_loss_detail($data_report['data']['expenses'], ['html' => '', 'row_index' => $row_index + 1, 'total_amount' => 0, 'total_py_amount' => 0], $parent_index, $currency);
            $row_index = $data['row_index'];
            echo new_html_entity_decode($data['html']);
            $total_expenses = $data['total_amount'];
         ?>
        <?php $row_index += 1; ?>
          <tr class="treegrid-total-<?php echo new_html_entity_decode($row_index); ?> treegrid-parent-<?php echo new_html_entity_decode($parent_index); ?> parent-node expanded tr_total">
            <td class="parent"><?php echo _l('total_for', _l('acc_expenses')); ?></td>
            <td></td>
            <td></td>
            <td></td>
            <td class="total_amount"><?php echo app_format_money($total_expenses, $currency->name); ?> </td>
            <td></td>
          </tr>
        <?php
         $row_index += 1;
         $parent_index = $row_index; ?>
        <tr class="treegrid-<?php echo new_html_entity_decode($row_index); ?> treegrid-parent-1000 parent-node expanded">
          <td class="parent"><?php echo _l('acc_other_expenses'); ?></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <?php 
        $data = $this->accounting_model->get_html_profit_and_loss_detail($data_report['data']['other_expenses'], ['html' => '', 'row_index' => $row_index + 1, 'total_amount' => 0, 'total_py_amount' => 0], $parent_index, $currency);
            $row_index = $data['row_index'];
            echo new_html_entity_decode($data['html']);
            $total_other_expenses = $data['total_amount'];
         ?>
          <?php $row_index += 1; ?>
          <tr class="treegrid-total-<?php echo new_html_entity_decode($row_index); ?> treegrid-parent-<?php echo new_html_entity_decode($parent_index); ?> parent-node expanded tr_total">
            <td class="parent"><?php echo _l('total_for', _l('acc_other_expenses')); ?></td>
            <td></td>
            <td></td>
            <td></td>
            <td class="total_amount"><?php echo app_format_money($total_other_expenses, $currency->name); ?> </td>
            <td></td>
          </tr>
          <?php $row_index += 1; ?>
        <tr class="treegrid-<?php echo new_html_entity_decode($row_index); ?> treegrid-parent-1000 parent-node expanded tr_total">
          <td class="parent"><?php echo _l('acc_net_income'); ?></td>
          <td></td>
          <td></td>
          <td></td>
          <td class="total_amount"><?php echo app_format_money(($total_income + $total_other_income) - ($total_cost_of_sales + $total_expenses + $total_other_expenses), $currency->name); ?></td>
          <td></td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
<script>
    $(document).ready(function() {
      $(function() {
          var tAPI = initDataTable('#report', '', [0], [0], {}, 
              <?= hooks()->apply_filters('customers_table_default_order', json_encode([2, 'asc'])); ?>
          );
      });
    });
</script>