import axios from 'axios';
import API_BASE_URL from '../config/url_config'

const getCurrentNumber = (position) => {
  return axios.get(`${API_BASE_URL}/api/v1/current?position=${position}`)
      .then(({data}) => data)
      .catch(error => {
        console.log("error", error);
      })
}

const getNextNumber = (position) => {  
  return axios.get(`${API_BASE_URL}/api/v1/next?position=${position}`)
      .then(res => {
        return res.data;
      })
      .catch(error => {
        console.log("error", error);
      })
}

const getPreviousNumber = (position) => {
  return axios.get(`${API_BASE_URL}/api/v1/previous?position=${position}`)
      .then(res => {
        return res.data;
      })
      .catch(error => {
        console.log("error", error);
      })
}

export {
  getCurrentNumber,
  getNextNumber,
  getPreviousNumber,
};