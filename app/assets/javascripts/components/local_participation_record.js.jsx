var LocalParticipationRecord = React.createClass({
  getInitalState() {
    //let lpr = JSON.parse(this.props.local_participation_record);
    let lpr = {
      user: {
        username: "simple test",
        twitter_user_id: "SimpleTest10"
      },
      xpos: 50,
      ypos: 50
    };
    return { local_participation_record: lpr };
  },
  componentDidMount() {
    this.setupSubscription();
  },
  setupSubscription() {
    App.turns = App.cable.subscriptions.create("TurnsChannel", {
      local_participation_record: this.state.local_participation_record.id,
      connected: function () {
        SetTimeout(() => this.perform('subscribe',
            {
              local_participation_record_id: this.local_participation_record_id
            }), 1000)
      },
      received: function (data) {
        this.updateTurnList(data.turn)
      },
      updateTurnList: this.updateTurnList
    });

  },
  updateTurnList: function (turn) {
    //TODO: mock newturn
    let newTurn = JSON.parse(turn);
    let lpr = this.props.local_participation_record
    lpr.turns.push(newTurn);
    this.setState({turn: newTurn});
    //TODO: append turns to list
  },
  render: function () {
    return (
        <div>
          <i id="player1" className="fa fa-user fa-lg player-icon" onClick={this.onClick}></i>
          {state.xpos} {state.ypos}
        </div>
    );
  }
});
