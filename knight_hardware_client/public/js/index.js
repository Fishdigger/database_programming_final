const api_url = "http://localhost:4000/api/";

function displayOrders() {
    let url = api_url + "orders";
    $.get(url).then((data) => {
        let html = buildOrderTable(data);
        $("#order-table").html(html);
        $("#logo-container").hide();
        $("#order-details").hide();
        $("#order-form").hide();
        $("#parts-table").hide();
        $("#order-table").show();
    });
}

function buildOrderTable(orders) {
    let html = `
        <div class="row">
        <table class="striped">
            <tr>
                <th>Order Number</th>
                <th>Customer Number</th>
                <th>Order Date</th>
            </tr>
    `
    orders.forEach((order) => {
        html += `<tr>
            <td>${order.order_number}</td>
            <td>${order.customer_number}</td>
            <td>${order.order_date}</td>
            <td><a href="javascript:showOrderDetails(${order.order_number})" class="order-details-link">Details</a></td>
        </tr>`
    });
    html += `</table></div>`;
    return html;
}

function buildOrderDetails(order) {
    console.log(order);
    let html = "";
    html = `<div class="center-align row">`;
    html += `<h3>Order ${order.order_number}</h3>`;
    html += `<p><b>Order Date:</b> ${order.order_date}</p>`;
    html += `<p><b>Customer:</b> ${order.customer.name} (${order.customer.city}, ${order.customer.state})</p>`;
    html += `<p><b>Parts:</b> `;
    order.parts.forEach((p) => {
        let detail = order.order_details.find(od => od.part_number == p.part_number);
        html += `${p.description}(x${detail.num_ordered}) `;
    });
    html += "</p>";
    html += "</div>";
    return html;
}

function showOrderDetails(id) {
    $.get(api_url + `orders/${id}`).then((order) => {
       let html = buildOrderDetails(order);
       $("#order-table").hide();
       $("#logo-container").hide();
       $("#parts-table").hide();
       $("#order-form").hide();
       $("#order-details").html(html);
       $("#order-details").show();
    });
}

function buildPartsTable(part_classes) {
    let html = "<div class='center-align row'>";
    html += "<table class='striped'>";
    html += "<tr>";
    html += "<th>Part Class</th>";
    html += "<th>Part Number</th>";
    html += "<th>Description</th>";
    html += "</tr>";
    part_classes.forEach((pc) => {
        pc.parts.forEach((part) => {
            html += "<tr>";
            html += `<td>${part.part_class}</td>`;
            html += `<td>${part.part_number}</td>`;
            html += `<td>${part.description}</td>`;
            html += "</tr>";
        });
    });
    html += "</table></div>";
    return html;
}

function showParts() {
    $.get(api_url + "part_classes").then((part_classes) => {
        let html = buildPartsTable(part_classes);
        $("#order-table").hide();
        $("#order-details").hide();
        $("#logo-container").hide();
        $("#order-form").hide();
        $("#parts-table").html(html);
        $("#parts-table").show();
    });
}

function createOrderForm() {
    let i = 0;
    $("#order-table").hide();
    $("#parts-table").hide();
    $("#logo-container").hide();
    $("#order-date-picker").pickadate({
        selectMonths: true,
        selectYears: 5,
        today: 'Today',
        clear: 'Clear',
        close: 'Ok',
        closeOnSelect: true,
        format: "yyyy-mm-dd"
    });
    $.get(api_url + "customers").then((customers) => {
        customers.forEach((cust) => {
            let html = `<option value="${cust.customer_number}">${cust.name}</option>`;
            $("#customer-select").append(html);
        });
        $("#customer-select").material_select();
    });
    buildPartSelects();
    $("#add-part-btn").click(() => {
        i += 1;
        addNewPart(i);
    })
    $("#order-form").show();
}

function buildPartSelects() {
    $.get(api_url + "parts").then((parts) => {
        parts.forEach((part) => {
            let html = `<option value="${part.part_number}">${part.description}</option>`;
            $(".part-select").append(html);
        });
        $(".part-select").material_select();
    });
}

function addNewPart(i) {
    let html = `
        <div class="row">
            <div class="input-field col s12 m6">
                <select class="part-select" id="part${i}">
                    <option value="" disabled selected>Select a part</option>
                </select>
            </div>
            <div class="input-field col s12 m6">
                <label for="quantity${i}">Quantity</label>
                <input type="number" step="1" min="1" id="quantity${i}">
            </div>
        </div>
    `
    $("#parts-input").append(html);
    $(`#part${i}`).material_select();
}

function placeOrder() {
    $("#order-form").hide();
    $("#logo-container").show();
    Materialize.toast("Submitted order", 5000);
}

$(document).ready(() => {
    $("#orders-link").click(() => {
        displayOrders();
    });
    $("#parts-link").click(() => {
        showParts();
    });
    $("#create-order-link").click(() => {
        createOrderForm();
    });
    $("#submit-order-btn").click(() => {
        placeOrder();
    });
});