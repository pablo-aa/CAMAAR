import axios from "axios";

const api = axios.create({
//   baseURL: "http://127.0.0.1:3000",
//   baseURL: "https://canvasjs.com",
  baseURL: "http://localhost:3030",
});

export default api;