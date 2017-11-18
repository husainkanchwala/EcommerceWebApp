 // Kanchwala, Husain    Account:  jadrn018
 // CS645, Spring 2017
 // Project 1


$(document).ready(function() {
  $('input[id^="q"]').each(function (i, el) {
     var id = el.id.replace("q","#q");
     var sku= el.id.replace("q","");
     setMaxMin(id,sku);
    });

   $('input[id^="q"]').change(function(event) {
    var val = parseInt($(this).val());
    var max = parseInt($(this).attr('max'));
    
    if(val>max){
      $("#error").html("quantity exceeds the maximum available "+max+" in the store");
      updateCartAmount();
    }else{
      $("#error").html("");
      updateCartQuantity(event.target.id);        
    }
  });

 updateCartAmount();
});

function addCart(sku){
    $.post("http://jadran.sdsu.edu/jadrn018/servlet/PutCart?sku="+sku,handle_add_cart);   
}

function handle_add_cart(response) { 
 updateCartAmount();
}

function setMaxMin(id,sku){
    $.ajax({
        type: "POST",
        url: "http://jadran.sdsu.edu/jadrn018/servlet/CheckQuantity", 
        data: "sku=" + sku,
        async: false,
        error: function() { 
          console.log("Server Issue while checking setting max min");
      }, 
      success: function(data){
        if(data=="0"){
       
        }
        else{
           $(id).attr({
             "max": data,
             "min": 1
            });
        }
    }
   });
}

function updateCartQuantity(id){
    var sku=id.replace("q",""); 
    var quanitytId=id.replace("q","#q"); 
	var quantity=$(quanitytId).val();
    $.post("http://jadran.sdsu.edu/jadrn018/servlet/UpdateCart?sku="+sku+"&quantity="+quantity,handle_cartQuanity);   	
}

function handle_cartQuanity(response){
        updateCartAmount();

}

function updateCartAmount(){
    $.post("http://jadran.sdsu.edu/jadrn018/servlet/GetCartAmount",handle_cartamount);   	
}

function handle_cartamount(response){
	 $("#camount").html(response);
	 $('input[id^="q"]').each(function (i, el) {
     var id = el.id.replace("q","#q");
     var quantity=parseInt(response);
     $(id).val(quantity);
    });
}




