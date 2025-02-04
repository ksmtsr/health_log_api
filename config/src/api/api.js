import axios from "axios";

const api = axios.create({
  baseURL: "http://localhost:3000", // Rails APIのURL
  timeout: 5000, // タイムアウト5秒
  headers: {
    "Content-Type": "application/json",
    Accept: "application/json",
  },
});

export default api;
