const createChart = (id, argChartData, argChartLabels) => {
  var ctx = document.getElementById("product-chart-");

  let chartData = argChartData;
  let chartLabels = argChartLabels;
  console.log("creating chart");

  var ctx = document.getElementById(`product-chart-${id}`).getContext('2d');
  var myChart = new Chart(ctx, {
      type: 'pie',
      data: {
          labels: chartLabels,
          datasets: [{
              label: '# of Votes',
              data: chartData,
              backgroundColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderColor: [
                  'rgba(255,99,132,1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 1
          }]
      },
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero:true
                  }
              }]
          }
      }
  });

}


const generateCharts = () => {

  const productCharts = document.querySelectorAll(".js-product-chart");



  productCharts.forEach((productChart) => {

    let id = productChart.dataset.projectid;
    console.log("productChart");

    console.log(typeof productChart.dataset.chartlabeldata);
    console.log(productChart.dataset.chartlabeldata);
    let string = productChart.dataset.chartlabeldata;
    let jsObj = JSON.parse(string);
    console.log(jsObj);

    let chartData = Object.values(jsObj);
    let chartLabels = Object.keys(jsObj);
    console.log(chartLabels);
    console.log(chartData);
    // let chartLabels = productChart.dataset.chartlabel;
    createChart(id, chartData, chartLabels);

  });

}

generateCharts()

export { createChart };
