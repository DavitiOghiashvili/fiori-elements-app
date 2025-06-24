const cds = require("@sap/cds");

class StoreService extends cds.ApplicationService {
  init() {
    const { Stores, Products, ProductComments } = this.entities;

    this.before(["READ"], Stores, this.sortTheResult);
    this.before(["READ"], Products, this.sortTheResult);
    this.before(["READ"], ProductComments, this.sortTheResult);

    this.on("getCurrentUser", async () => {
      return "User";
    });

    this.on("getAverageRating", async () => {
      return 4;
    });

    this.on("mutate", async (req) => {
      if (!req.req.body.param) throw new Error("No param provided");

      return "Success";
    });

    return super.init();
  }

  sortTheResult(req, resp) {
    if (req.event === "READ") {
      const aOrderBy = [];
      if (req.query.SELECT.orderBy) {
        req.query.SELECT.orderBy.forEach((orderBy) => {
          if (orderBy.ref[0] !== "ID" && orderBy.ref[0] !== "createdAt") {
            aOrderBy.push(orderBy);
          }
        });
      }
      if (!aOrderBy.length) {
        aOrderBy.push({ ref: ["createdAt"], sort: "desc" });
      }
      req.query.SELECT.orderBy = aOrderBy;
    }
  }
}

module.exports = StoreService;
