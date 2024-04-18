import axios from 'axios';

const axiosInstance = axios.create();

axiosInstance.interceptors.request.use(
  function(config) {
    // Do something before request is sent
    const cachedD = ''; // Get your cachedD value here
    if (cachedD) {
      config.headers['Authorization'] = `Bearer ${cachedD}`;
    }
    config.headers['Content-Type'] = 'application/json';
    config.headers['Access-Control-Allow-Headers'] = 'Authorization';
    return config;
  },
  function(error) {
    // Do something with request error
    return Promise.reject(error);
  }
);

export default axiosInstance;
