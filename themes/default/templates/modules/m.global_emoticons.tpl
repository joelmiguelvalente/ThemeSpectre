<div id="emoticons"{if $tsPage == 'agregar'} class="agregar"{/if} style="display:none;">
   <div class="espera"><div class="loading loading-lg"></div></div>
</div>
<script>
$(document).ready(function(){
   $.ajax({
      url: global_data.url + '/emoticones.php',
      success: function(h) {
         $('#emoticons').html(h);
         $('.espera').remove(2000);
      }
   });
});
$('#emoticons').click(function(e) {
   e.preventDefault();
   // console.log(e);
   var smile = e.target.attributes[2].value;
   $('.wysibb-body').append(smile);
});
</script>