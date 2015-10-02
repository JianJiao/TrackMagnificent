var completedItems;

completedItems = {
  itemsId: [],
  date: new Date(),
  updateItems: function() {
    var today;
    console.log('called');
    today = new Date();
    today.setHours(0, 0, 0, 0);
    this.date.setHours(0, 0, 0, 0);
    if (today.valueOf() !== this.date.valueOf()) {
      return this.items = [];
    }
  },
  getItemsId: function() {
    this.updateItems();
    return this.itemsId;
  }
};

module.exports = completedItems;

//# sourceMappingURL=completedItems.js.map
