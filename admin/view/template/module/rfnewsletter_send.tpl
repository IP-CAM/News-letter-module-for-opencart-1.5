<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/mail.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a id="button-send" onclick="/*$('#mail_form').submit();*/send('index.php?route=module/rfnewsletter/send&token=<?php echo $token; ?>');" class="button"><?php echo $button_send; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
    <form method="post" id="mail_form">
        <table id="mail" class="form">
          
          <tr>
            <td><span class="required">*</span> <?php echo $entry_subject; ?></td>
            <td><input type="text" name="subject" value="" /></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_message; ?></td>
            <td><textarea name="message"></textarea></td>
          </tr>
        </table>
    </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript" src="view/javascript/ckeditor/adapters/jquery.js"></script> 
<script type="text/javascript"><!--
$('textarea[name=\'message\']').ckeditor({
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
//--></script> 
<script type="text/javascript"><!--	

function send(url) { 
	$('textarea[name=\'message\']').html($('textarea[name=\'message\']').val());
	// alert($('textarea[name=\'message\']').val());
	$.ajax({
		url: url,
		type: 'post',
		data: $('input, textarea'),		
		dataType: 'json',
		beforeSend: function() {
			$('#button-send').attr('disabled', true);
			$('#button-send').before('<span class="wait"><img src="view/image/loading.gif" alt="" />&nbsp;</span>');
		},
		complete: function() {
			$('#button-send').attr('disabled', false);
			$('.wait').remove();
		},				
		success: function(json) {
			$('.success, .warning, .error').remove();
			
			if (json['error']) {
				if (json['error']['warning']) {
					$('.box').before('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
			
					$('.warning').fadeIn('slow');
				}
				
				if (json['error']['subject']) {
					$('input[name=\'subject\']').after('<span class="error">' + json['error']['subject'] + '</span>');
				}	
				
				if (json['error']['message']) {
					$('textarea[name=\'message\']').parent().append('<span class="error">' + json['error']['message'] + '</span>');
				}									
			}			
			
			if (json['next']) {
				if (json['success']) {
					//$('.box').before('<div class="success">' + json['success'] + '</div>');
					
					send(json['next']);
				}		
			} else {
									
			}
			if (json['success']) {
				$('.box').before('<div class="success">' + json['success'] + '</div>');
		
				$('.success').fadeIn('slow');
			}				
		}
	});
}
//--></script> 
<?php echo $footer; ?>