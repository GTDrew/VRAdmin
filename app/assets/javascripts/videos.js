var ready, set_positions;

set_positions = function(){
    $('.panel.panel-default').each(function(i){
        $(this).attr("data-pos",i+1);
    });
}

ready = function(){

    set_positions();

    $('.sortable').sortable();

    // after the order changes
    $('.sortable').sortable().bind('sortupdate', function(e, ui) {
        // array to store new order
        updated_order = []
        // set the updated positions
        set_positions();

        $appId = $('.sortable').data('app-id')

        // populate the updated_order array with the new task positions
        $('.panel.panel-default').each(function(i){
            updated_order.push({ id: $(this).data("id"), position: i+1 });
        });

        // send the updated order via ajax
        $.ajax({
            type: "PUT",
            url: "/apps/" + $appId + "/videos/sort",
            data: { order: updated_order }
        });
    });
}

$(document).ready(ready);
