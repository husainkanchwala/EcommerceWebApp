 // Kanchwala, Husain    Account:  jadrn018
 // CS645, Spring 2017
 // Project 1


$(document).ready(function() {
  $( "#menu" ).menu({
      items: "> :not(.ui-widget-header)"
    });
  $( ".controlgroup" ).controlgroup();
   updateCartAmount();
   fetchCategory();
   fetchVendor();
   });

function fetchCategory(){
    $.post("http://jadran.sdsu.edu/jadrn018/servlet/FetchCategory",handle_category_recieved);   
}     

function handle_category_recieved(response) { 
    if(response){
        var str = response.split("|");
        insertCategoryDiv(str);
    }
}

function insertCategoryDiv(str){
    var i=0;    
    for(var j=1;j<=str.length;j++)
    {
      var d_id = i+1;
      $( "<a href='GetProduct?category=true&id="+j+"' ><li class='ui-menu-item' id='Cli-"+j+"'><div class='ui-menu-item-wrapper' id='Cdiv-"+j+"'>"+str[i]+"</div></li></a>" ).insertAfter( "#Cli-"+i );
      i++; 
    }  
}    

function fetchVendor(){
    $.post("http://jadran.sdsu.edu/jadrn018/servlet/FetchVendor",handle_vendor_recieved);   
}     

function handle_vendor_recieved(response) { 
  if(response){
  var str = response.split("|");
  insertVendorDiv(str);
  }
}

function insertVendorDiv(str){
    var i=0;    
    for(var j=1;j<=str.length;j++)
    {
      var d_id = i+1;
      $( "<a href='GetProduct?vendor=true&id="+j+"' ><li class='ui-menu-item' id='Vli-"+j+"'><div class='ui-menu-item-wrapper' id='Vdiv-"+j+"'>"+str[i]+"</div></li></a>" ).insertAfter( "#Vli-"+i );
      i++; 
    }  
}    

function updateCartAmount(){
	  $.post("http://jadran.sdsu.edu/jadrn018/servlet/GetCartAmount",handle_cartamount);   	
}

function handle_cartamount(response){
	$("#camount").html(response);
}


function addCart(sku){
    $.post("http://jadran.sdsu.edu/jadrn018/servlet/PutCart?sku="+sku,handle_add_cart);   
}

function handle_add_cart(response) { 
	updateCartAmount();
}


