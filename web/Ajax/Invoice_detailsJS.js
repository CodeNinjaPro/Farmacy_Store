selectedRowToInput_invoice_details();
function selectedRowToInput_invoice_details() {
    var table = document.getElementById('cart_table'), rIndex;
    for (var i = 1; i < cart_table.rows.length; i++) {
        cart_table.rows[i].onclick = function () {
            rIndex = this.rowIndex;
            document.getElementById("item_dump").value = this.cells[1].textContent;
            document.getElementById("qty").value = this.cells[2].textContent;
        };
    }
}

function save_invoice_details() {
    var invoice_details_id = $('#invoice_details_id').val();
    var invoice_id_i = $('#invoice_id_i').val();
    var item_registration_id = $('#item_registration_id').val();
    var qty = $('#qty').val();
    var date_time_i = $('#date_time_i').val();
    var action = "cart_insert";
    if (invoice_details_id === "" || invoice_id_i === "" || item_registration_id === "" || qty === "" || date_time_i === "") {
        alert("Please Enter All Details")
    } else {
        $.ajax({
            url: 'Invoice_detailsServlet',
            method: 'POST',
            data: {action: action, invoice_details_id: invoice_details_id, invoice_id_i: invoice_id_i, item_registration_id: item_registration_id, qty: qty, date_time_i: date_time_i},
            success: function (resultText) {
                alert("Added!");
                document.getElementById("total").value = resultText;
                $("#cart_table").find("tr:gt(0)").remove();
                load_invoice_details();
            },
            error: function (jqXHR, exception) {
                alert("Fail Ajax");
            }
        });
    }
}

function update_invoice_details() {
    var invoice_details_id = $('#invoice_details_id').val();
    var invoice_id_i = $('#invoice_id_i').val();
    var item_registration_id = $('#item_registration_id').val();
    var qty = $('#qty').val();
    var date_time_i = $('#date_time_i').val();
    var action = "update";
    invoice_details_id = parseInt(invoice_details_id);
    if (invoice_details_id === 0) {
        alert("Please Select to Update")
    } else if (invoice_details_id === "" || invoice_id_i === "" || item_registration_id === "" || qty === "" || date_time_i === "") {
        alert("Please Enter All Details")
    } else {
        $.ajax({
            url: 'Invoice_detailsServlet',
            method: 'POST',
            data: {action: action, invoice_details_id: invoice_details_id, invoice_id_i: invoice_id_i, item_registration_id: item_registration_id, qty: qty, date_time_i: date_time_i},
            success: function (resultText) {
                alert("Added!");
                document.getElementById("total").value = resultText;
                $("#cart_table").find("tr:gt(0)").remove();
                load_invoice_details();
            },
            error: function (jqXHR, exception) {
                alert("Fail Ajax");
            }
        });
    }
}

function delet_invoice_details() {
    var item_dump = $('#item_dump').val();
    var action = "cart_delete";
    item_dump = parseInt(item_dump);
    if (item_dump === 0) {
        alert("Please Select to Remove")
    } else {
        var r = confirm("Are you Sure?");
        if (r == true) {
            $.ajax({
                url: 'Invoice_detailsServlet',
                method: 'POST',
                data: {action: action, item_dump: item_dump},
                success: function (resultText) {
                    document.getElementById("total").value = resultText;
                    $("#cart_table").find("tr:gt(0)").remove();
                    load_invoice_details();
                    alert("Removed")
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

function load_invoice_details() {
    $("#cart_table").find("tr:gt(0)").remove();
    var table = document.getElementById('cart_table');
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
        url: 'Invoice_detailsServlet',
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
                    var newRow = table.insertRow(table.length),
                            cell0 = newRow.insertCell(0),
                            cell1 = newRow.insertCell(1),
                            cell2 = newRow.insertCell(2),
                            k = i + 1;
                    cell0.innerHTML = k;
                    cell1.innerHTML = step2[2];
                    cell2.innerHTML = step2[3];
                }
            }
            selectedRowToInput_invoice_details();
        },
        error: function (jqXHR, exception) {
            alert("Fail Ajax")
        }
    });
    document.getElementById("form").reset();
}