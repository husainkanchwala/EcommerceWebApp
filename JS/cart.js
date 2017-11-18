 // Kanchwala, Husain    Account:  jadrn018
 // CS645, Spring 2017
 // Project 1
$(document).ready(function() {
   // $('input[id^="q"]').change(function(event) {
   //      calculateCart(event.target.id);
   //      calculateGrandTotal();
   //      updateCartQuantity(event.target.id);
   //  });
   
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
        calculateCart(event.target.id);
        calculateGrandTotal();
        updateCartQuantity(event.target.id);        
    }
   });

     calculateGrandTotal();
     updateCartAmount();

});

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


function handle_cartQuanity(response){
        updateCartAmount();

}

function calculateGrandTotal(){
	var grandTotal = 0.0;
	$('.totalprice').each(function()
	{
    	grandTotal += parseFloat($(this).text());
	});	
    $("#gt").html(grandTotal);
}

function calculateCart(qId) {
	var quanitytId=qId.replace("q","#q"); 
    var priceId=qId.replace("q","#p"); 
    var orderTId=qId.replace("q","#ot"); 

    var price = parseFloat($(priceId).text()),
        qty = parseInt($(quanitytId).val()),
        ext = parseFloat(price * qty);

    $(orderTId).html(ext.toFixed(2));
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
}

function removeCart(sku){
    $.post("http://jadran.sdsu.edu/jadrn018/servlet/RemoveCart?sku="+sku,handle_remove_cart);   
}

function handle_remove_cart(response) { 
 updateCartAmount();
}


