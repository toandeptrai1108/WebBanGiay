<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thong ke</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
        // Tải thư viện Google Chart
        google.charts.load('current', {packages: ['corechart']});

        // Khi thư viện đã tải xong, tạo biểu đồ
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            // Dữ liệu sản phẩm bán chạy
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Tên Sản phẩm');
            data.addColumn('number', 'Số lượng mua');
            data.addRows([
                <c:forEach items="${hangBanChayList.getContent()}" var="order">
                ['${order.tenSanPham}', ${order.soLuongDaBan}],
                </c:forEach>
            ]);

            // Tùy chỉnh biểu đồ
            var options = {
                title: 'Top 10 mặt hàng bán chạy nhất',
                chartArea: {width: '50%'},
                hAxis: {
                    title: 'Số lượng mua',
                    minValue: 0
                },
                vAxis: {
                    title: 'Tên Sản phẩm'
                }
            };

            // Vẽ biểu đồ cột
            var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>

    <script>
        google.charts.load('current', {packages: ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Tên Sản phẩm');
            data.addColumn('number', 'Số lượng tồn kho');
            data.addRows([
                <c:forEach items="${listSanPham}" var="item">
                ['${item.tensanpham}', ${item.soluongbanra}],
                </c:forEach>
            ]);

            var options = {
                title: 'Top 10 mặt hàng tồn kho nhiều nhất',
                chartArea: {width: '50%'},
                hAxis: {
                    title: 'Số lượng tồn kho',
                    minValue: 0
                },
                vAxis: {
                    title: 'Tên Sản phẩm'
                }
            };

            var chart = new google.visualization.BarChart(document.getElementById('chart_div2'));
            chart.draw(data, options);
        }
    </script>

</head>
<body>
<%-- <jsp:include page="../admin/quan-ly.jsp" /> --%>
<div class="container mt-3">
    <h2>Top 10 mặt hàng bán chạy nhất</h2>
    <div class="row">
        <div class="col-lg-6">
            <div id="chart_div"></div>
        </div>
        <div class="col-lg-6">
            <table class="table">
                <thead>
                <tr>
                    <th>Tên Sản phẩm</th>
                    <th>Số lượng mua</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listSanPham}" var="order">
                    <tr>
                        <td>${order.tensanpham}</td>
                        <td>${order.soluongbanra}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <h2>Top 10 mặt hàng tồn kho nhiều nhất</h2>
    <div class="row">
        <div class="col-lg-6">
            <div id="chart_div2"></div>
        </div>
        <div class="col-lg-6">
            <table class="table">
                <thead>
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng tồn kho</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listSanPham}" var="item">
                    <tr>
                        <td>${item.tensanpham}</td>
                        <td>${item.soluongbanra}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>