import axios from "axios";

const api = axios.create({
  baseURL: process.env.REACT_APP_API_URL, // 環境変数からURLを取得
  timeout: 5000, // タイムアウト5秒
  headers: {
    "Content-Type": "application/json",
    Accept: "application/json",
  },
});

export default api;
