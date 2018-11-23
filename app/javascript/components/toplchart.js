const createTopLChart = (argChartData, argChartLabels) => {
  var ctx = document.getElementById("top-lang-chart");

  let chartData = argChartData;
  let chartLabels = argChartLabels;
  // console.log("creating chart");

  var ctx = document.getElementById(`top-lang-chart`).getContext('2d');
  var myChart = new Chart(ctx, {
      type: 'pie',
      data: {
          labels: chartLabels,
          datasets: [{
              label: '# of Votes',
              data: chartData,
              backgroundColor: [
                '#3C4CA3',
                '#6C83FF',
                '#B5C1FF',
                '#34418C',
                '#5E77FF',
                '#A7B4FF',
                '#2B3774',
                '#566DE8',
                '#98A8FF',
                '#232C5D',
                '#4D62D1',
                '#899CFF',
                '#4557BA',
                '#7B8FFF',
                '#C4CDFF'
              ],
              borderColor: [
                  'rgba(255,255,255,0.8)',
                  'rgba(255,255,255,0.8)',
                  'rgba(255,255,255,0.8)',
                  'rgba(255,255,255,0.8)',
                  'rgba(255,255,255,0.8)',
                  'rgba(255,255,255,0.8)'
              ],
              borderWidth: 2
          }]
      },
    options: {
        legend: {

            display: true,
            position: "bottom",
            labels: {
                boxWidth: 10,
                fontSize: 10,
                padding: 5,
            }
        }
    }
  });
}


const generateTopLCharts = () => {

  const productCharts = document.querySelectorAll(".toplang-chart");



  productCharts.forEach((productChart) => {



    let string = productChart.dataset.toplchartlabeldata;
    let jsObj = JSON.parse(string);


    let chartData = Object.values(jsObj);
    let chartLabels = Object.keys(jsObj);

    createTopLChart(chartData, chartLabels);

  });

}

generateTopLCharts()

export { createTopLChart };
