import "bootstrap";


import { uploadButton } from "components/upload_button";
import { submitOnUpload} from "components/submit_on_upload";
import { submitOnUploadUser} from "components/submit_on_upload";
import {submitOnUploadProject} from "components/submit_on_upload";
import { uploadButtonProject } from "components/upload_button";



uploadButton();
submitOnUpload();
submitOnUploadUser();
submitOnUploadProject();
uploadButtonProject();

import { createChart } from '../components/chart.js.erb'
import { createTopLChart } from '../components/toplchart.js'
import { createComovertChart, generateComovertCharts } from '../components/comovertChart.js'
generateComovertCharts();

