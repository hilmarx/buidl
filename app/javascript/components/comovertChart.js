

const generateComovertCharts = () => {

  const comovertCharts = document.querySelector(".js-comovert-chart");
  const data = JSON.parse(comovertCharts.dataset.comovertchartlabeldata);
  const yearArray = JSON.parse(comovertCharts.dataset.yearArray);

  var chartOptions = {

    // events: ['mouseover'],
    tooltips: {
        // enabled: false,
         // mode: 'point',
    },

  legend: {
    // display: true,
    // position: 'bottom',
    // labels: {
    //   boxWidth: 10,
    //   fontColor: 'black'
    //   boxWidth: 10,
    //   fontSize: 10,
    //   padding: 5,
    // }
  },
  scales: {
    // xAxes: [{
    //   gridLines: {
    //     display: false,
    //     color: "black"
    //   },
    //   scaleLabel: {
    //     display: false,
    //     labelString: "Time in Seconds",
    //     fontColor: "red"
    //   }
    // }],
    // yAxes: [{
    //   gridLines: {
    //     display: true,
    //     color: 'rgba(55,55,55,0.1',
    //     lineWidth: 0.5,
    //     // borderDash: [2, 5],
    //   },
    //   scaleLabel: {
    //     display: false,
    //     labelString: "Speed in Miles per Hour",
    //     fontColor: "green"
    //   }
    // }]
  }
};


  var mixedChart = new Chart(comovertCharts, {
    type: 'line',
    data: {
      datasets: Object.keys(data).map((name) => {
        return {
          label: name,
          data: data[name],
          fill: true,
          // lineTension: 0.5,
          // pointBackgroundColor,
          // pointBorderColor,
          // pointBorderWidth: 1,
          // pointRadius: 2,
          // borderColor: [
          //       'rgba(94,119,255,1)',
          //     ],
          // backgroundColor: [
          //       'rgba(94,119,255,0.1)',
          //     ],
          // borderWidth: 0.5,
        }
      }),

      labels: yearArray
    },
    options: chartOptions
  });



  global.mixedChart = mixedChart

}


export { generateComovertCharts };
