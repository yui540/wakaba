
riot.tag2('color', '', 'color,[data-is="color"]{ float: left; display: block; width: 25px; height: 25px; margin-top: 5px; margin-left: 5px; border-radius: 5px; cursor: pointer; }', 'riot-style="background-color:{color}" onclick="{onClick}"', function(opts) {
this.color = opts.color;

this.onClick = function() {
  observer.trigger('color', this.color);
  return ipc.send('color', this.color);
};
});