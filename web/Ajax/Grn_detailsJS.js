selectedRowToInputCart();
function selectedRowToInputCart() {
    var cart_table = document.getElementById('cart_table'), rIndex;
    for (var i = 1; i < cart_table.rows.length; i++) {
        cart_table.rows[i].onclick = function () {
            rIndex = this.rowIndex;
            document.getElementById("item_dump").value = this.cells[1].textContent;
        };
    }
}

function save_grn_detail() {
    var grn_details = $('#grn_details').val();
    var grn_id_d = $('#grn_id_d').val();
    var item_registration_id = $('#item_registration_id').val();
    var qty = $('#qty').val();
    var unit_price = $('#unit_price').val();
    var status_d = $('#status_d').val();
    var date_time_d = $('#date_time_d').val();
    var action = "cart_insert";
    if (grn_details === "" || grn_id_d === "" || item_registration_id === "" || qty === "" || unit_price === "" || status_d === "" || date_time_d === "") {
        alert("Please Enter All Details")
    } else {
        $.ajax({
            url: 'Grn_detailsServlet',
            method: 'POST',
            data: {action: action, grn_details: grn_details, grn_id_d: grn_id_d, item_registration_id: item_registration_id, qty: qty, unit_price: unit_price, status_d: status_d, date_time_d: date_time_d},
            success: function (resultText) {
                alert("Added!");
                document.getElementById("total").value = resultText;
                $("#cart_table").find("tr:gt(0)").remove();
                load_grn_details();
            },
            error: function (jqXHR, exception) {
                alert("Fail Ajax");
            }
        });
    }
}

function update_grn_details() {
    var grn_details = $('#grn_details').val();
    var grn_id_d = $('#grn_id_d').val();
    var item_registration_id = $('#item_registration_id').val();
    var qty = $('#qty').val();
    var unit_price = $('#unit_price').val();
    var status_d = $('#status_d').val();
    var date_time_d = $('#date_time_d').val();
    var action = "cart_update";
    grn_details = parseInt(grn_details);
    if (grn_details === 0) {
        alert("Please Select to Update")
    } else if (grn_details === "" || grn_id_d === "" || item_registration_id === "" || qty === "" || unit_price === "" || status_d === "" || date_time_d === "") {
        alert("Please Enter All Details")
    } else {
        $.ajax({
            url: 'Grn_detailsServlet',
            method: 'POST',
            data: {action: action, grn_details: grn_details, grn_id_d: grn_id_d, item_registration_id: item_registration_id, qty: qty, unit_price: unit_price, status_d: status_d, date_time_d: date_time_d},
            success: function (resultText) {
                alert(resultText);
                $("#cart_table").find("tr:gt(0)").remove();
                load_grn_details();
            },
            error: function (jqXHR, exception) {
                alert("Fail Ajax");
            }
        });
    }
}

function delete_grn_detail() {
    var item_dump = $('#item_dump').val();
    var action = "cart_delete";
    item_dump = parseInt(item_dump);
    if (item_dump === 0) {
        alert("Please Select to Remove")
    } else {
        var r = confirm("Are you Sure?");
        if (r == true) {
            $.ajax({
                url: 'Grn_detailsServlet',
                method: 'POST',
                data: {action: action, item_dump: item_dump},
                success: function (resultText) {
                    document.getElementById("total").value = resultText;
                    $("#cart_table").find("tr:gt(0)").remove();
                    load_grn_details();
                    alert("Removed!");
                },
                error: function (jqXHR, exception) {
                    alert("Fail Ajax");
                }
            });
        } else {
            alert("Not Deleted")
        }
    }
}

function load_grn_details() {
    var cart_table = document.getElementById('cart_table');
    var dropdown2 = document.getElementById('item_registration_id');
    $('#item_registration_id')
            .find('option')
            .remove()
            .end()
            ;

    var action = "serch";
    $.ajax({
        url: 'Item_registrationServlet',
        method: 'POST',
        data: {action: action},
        success: function (resultText) {


            resultText = resultText.replace("[", "");
            resultText = resultText.replace("]", "");

            var c = [];
            c = resultText;


            if (c.length > 1) {

                var step1 = [];
                var step2 = [];
                step1 = resultText.split("~");

                for (i = 0; i < step1.length; ++i) {
                    step2 = step1[i].split("_");
                    var option = document.createElement("option");
                    option.text = step2[1];
                    option.value = step2[0];
                    dropdown2.add(option);

                }
            }

        },
        error: function (jqXHR, exception) {
            swal("fail");
        }
    });
    var action = "cart_serch";
    $.ajax({
        url: 'Grn_detailsServlet',
        method: 'POST',
        data: {action: action},
        success: function (resultText) {
            resultText = resultText.replace("[", "");
            resultText = resultText.replace("]", "");
            var c = [];
            c = resultText;
            if (c.length > 5) {
                var step1 = [];
                var step2 = [];
                step1 = resultText.split("~");
                for (i = 0; i < step1.length; ++i) {
                    step2 = step1[i].split("_");
                    var newRow = cart_table.insertRow(cart_table.length),
                            cell0 = newRow.insertCell(0),
                            cell1 = newRow.insertCell(1),
                            cell2 = newRow.insertCell(2),
                            cell3 = newRow.insertCell(3),
                            cell4 = newRow.insertCell(4),
                            k = i + 1;
                    cell0.innerHTML = k;
                    cell1.innerHTML = step2[2];
                    cell2.innerHTML = step2[3];
                    cell3.innerHTML = step2[4];
                    cell4.innerHTML = step2[5];
                }
            }
            selectedRowToInputCart();
        },
        error: function (jqXHR, exception) {
            alert("Fail Ajax")
        }
    });
    document.getElementById("form").reset();
}

function getItemDetails() {
    var item_registration_id = $('#item_registration_id').val();
    var action = "serch_item";

    $.ajax({
        url: 'Item_registrationServlet',
        method: 'POST',
        data: {action: action, item_registration_id: item_registration_id},
        success: function (resultText) {
            document.getElementById("unit_price").value = resultText;
        },
        error: function (jqXHR, exception) {
            alert("fail");
        }
    });
}
