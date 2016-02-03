var NewPlayer = React.createClass({
  onClick: function (event){
  },
  render: function () {
    return (
      <div>
        <i id="player1" className="fa fa-user fa-lg player-icon" onClick={this.onClick}></i>
      </div>
    );
  }
});
