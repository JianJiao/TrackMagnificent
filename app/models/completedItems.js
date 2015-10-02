var completedItems;

completedItems = {
  itemsId: {},
  date: new Date(),
  updateItems: function() {
    var today;
    console.log('called');
    today = new Date();
    today.setHours(0, 0, 0, 0);
    this.date.setHours(0, 0, 0, 0);
    if (today.valueOf() !== this.date.valueOf()) {
      return this.itemsId = {};
    }
  },
  getItemsId: function() {
    this.updateItems();
    console.log('is this correct?');
    console.log(this.itemsId);
    console.log('look ahead');
    return this.itemsId;
  },
  add: function(id) {
    this.itemsId[id] = 1;
    return console.log(this.itemsId);
  }
};

module.exports = completedItems;

//# sourceMappingURL=completedItems.js.map
