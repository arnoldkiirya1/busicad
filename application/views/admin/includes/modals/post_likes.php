<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<!-- Likes -->
<div class="modal likes_modal fade" id="modal_post_likes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
            aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">
          <?= _l('newsfeed_post_likes_modal_heading'); ?>
        </h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div id="modal_post_likes_wrapper">

          </div>

        </div>

      </div>
      <div class="modal-footer">
        <a href="#"
          class="btn btn-primary load_more_post_likes"><?= _l('load_more'); ?></a>
      </div>
    </div>
  </div>
</div>