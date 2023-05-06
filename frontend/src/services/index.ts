import request from "../api/request";
const Service = {
  getArticles: async () => {
    const res = await request("GET", "/articles", "");
    return res.data;
  }
}

export default Service;