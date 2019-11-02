import axios from 'axios';
import API_BASE_URL from '../config/url_config'

const getCurrentNumber = () => {  
  return axios.get(`${API_BASE_URL}/api/v1/current`)
      .then(res => {
        return res.data;
      })
      .catch(error => {
        console.log("error", error);
      })
}

const getNextNumber = () => {  
  return axios.get(`${API_BASE_URL}/api/v1/next`)
      .then(res => {
        return res.data;
      })
      .catch(error => {
        console.log("error", error);
      })
}

const getPreviousNumber = () => {
  return axios.get(`${API_BASE_URL}/api/v1/previous`)
      .then(res => {
        return res.data;
      })
      .catch(error => {
        console.log("error", error);
      })
}

const resetNumber = () => {  
  return axios.get(`${API_BASE_URL}/api/v1/reset`)
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
  resetNumber,
};