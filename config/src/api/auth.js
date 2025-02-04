import api from "./api";

const login = async (username, password) => {
  try {
    const response = await api.post("/login", { username, password });
    console.log(response.data);
    return response.data;
  } catch (error) {
    console.error("Login failed", error.response?.data || error.message);
  }
};

export { login };
