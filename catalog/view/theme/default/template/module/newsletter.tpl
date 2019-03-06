<div style='display:none'>
    <a href="#inline_content"></a>
    <div id='inline_content' style='padding:10px; background:#fff;'>
        <div class="dod-sub-popup" id="hiddenSubscribeAlertDeal">
            <!-- <div class="popupBalloon1"></div>
            <div class="popupBalloon2"></div>
            <div class="popupBalloon3"></div> -->
            <div class="popupTitle align-c">
                <span class="titlePart1 display-block">مرحباً!</span>
                <span class="titlePart2 display-block">هل تحب الصفقات الجيدة؟</span>
                <span class="titlePart3 display-block">قد وصلت إلى المكان الصحيح.</span>
            </div>
            <div class="popupDescription">
                اشترك للحصول على خصومات خاصة وابق على <br>
                علم بأحدث المنتجات و العروض الترويجية.
            </div>
            <div class="mart-20 marb-15">
                <div>
                    <div id="response-loading"></div>
                </div>
                <div id="subscribeFields">
                    <form id="deals_subscription_form" method="post">
                        <label title="" for="" class="popupLabel display-block">أدخل عنوان البريد الإلكتروني</label>
                        <input value="البريد الإلكتروني" name="email" id="email" type="text" class="popupField">
                        <div class="fl">
                            <input type="button" class="button-style-orange width-140 height-40" name="subscribe" id="submitNewsletter" value="اشترك">
                        </div>
                    </form>
                    <div class="fl marl-15"> <a href="javascript:;" onclick="$('#cboxClose').trigger('click');return false;" class="linh-40 text-decor-line">لا شكرا، أنا مشترك مسبقا.</a> </div>
                    </div><!-- /#subscribeFields -->
                </div>
            </div>
        </div>
    </div>


<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/css/colorbox.css">
<script src="catalog/view/theme/default/js/jquery.colorbox.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$.colorbox({width:"50%", inline:true, href:"#inline_content"});
	});
</script>
<script type="text/javascript">
	$(document).ready(function(){
		//clear inputs
		$('#name').click(function(){
			if($(this).val() == '<?php echo $name; ?>') {
				$(this).attr('value','');
			}
		});
		$('#email').click(function(){
			if($(this).val() == 'البريد الإلكتروني') {
				$(this).attr('value','');
			}
		});
		
		//save data
		$('#submitNewsletter').click(function(){
			//validate form
			errors = 0;
			if(($('#name').val() == '') || ($('#name').val() == '<?php echo $name; ?>')) {
				//$('#name').css('border','solid red 1px');
				//errors++;
			} else {
				//$('#name').css('border','0px');
			}
			if(($('#email').val() == '') || ($('#email').val() == 'البريد الإلكتروني')) {
				$('#email').css('border','solid red 1px');
				errors++;
			} else {
				$('#email').css('border','0px');
			}
			//submit data
			if(errors == 0) {
				$.ajax({
					url: 'index.php?route=module/rfnewsletter/save',
					type: 'POST',
			        //dataType: 'json',
					data: { 
						//name: $('#name').val(),
						email: $('#email').val()
						},
				    beforeSend: function() {
			            $('.success, .warning').remove();
			            $('#response-loading').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
			        },
			        complete: function() {
			            $('#button-review').attr('disabled', false);
			            $('.attention').remove();
			        },
			        success: function(respons) {
				    	if(respons){
                			$('#response-loading').after('<div class="success">تم بنجاح</div>');
			            }else{
			                $('#response-loading').after('<div class="warning">البريد الاكتروني غير صجيج</div>');
                		}
				    }
				});
			}
		});
	});
</script>