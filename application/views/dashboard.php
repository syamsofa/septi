<div class="row">

    <div class="col-xl-12">
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-chart-bar me-1"></i>
                Status Perangkat TI
            </div>
            <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
        </div>
    </div>
</div>

<script>
    $.ajax({
        type: "POST",
        cache: false,
        url: '<?php echo base_url(); ?>/servicesdevice/show_device_by_status',
        dataType: 'json',
        data: {},
        success: function(output) {
            // $("#buttonSubmit").html(" Login ");

            labels = [];
            datas = [];
            output.forEach(element => {
                labels.push(element['device_status'])
                datas.push(parseInt(element['jumlah']))
            });
            console.log(datas)

            // Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';

            console.log(labels)
            // Bar Chart Example
            var ctx = document.getElementById("myBarChart");
            var myLineChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: "Revenue",
                        backgroundColor: "rgba(2,117,216,1)",
                        borderColor: "rgba(2,117,216,1)",
                        data: datas,
                    }],
                },
                options: {
                    scales: {
                        xAxes: [{
                            time: {
                                unit: 'month'
                            },
                            gridLines: {
                                display: false
                            },
                            ticks: {
                                maxTicksLimit: 6
                            }
                        }],
                        yAxes: [{
                            ticks: {
                                min: 0,
                                max: 100,
                                maxTicksLimit: 5
                            },
                            gridLines: {
                                display: true
                            }
                        }],
                    },
                    legend: {
                        display: false
                    }
                }
            });

        }

    })
</script>