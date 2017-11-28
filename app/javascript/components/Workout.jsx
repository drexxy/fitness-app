import React, { Component } from 'react';
import WorkoutForm from './Workoutform'
import ItemList from './Itemlist'
import 'babel-polyfill';

class Workout extends Component {

  constructor(props){
    super(props);
    this.state = {
      selected: [],
    }
  this.handleClick = this.handleClick.bind(this)
  }

  handleClick(i){
    this.state.selected.push(this.props.items[i])
    this.setState({
      selected: this.state.selected
    })
  
  }

  render(){
    return <div className="grid">
        <div className="workout-form col col-3-of-4">
          <WorkoutForm selected = { this.state.selected } />
        </div>
        <div className="day-workout-list col col-1-of-4">
          <ItemList items = { this.props.items } handleClick = { this.handleClick } /> 
        </div>
      </div>
  }

}

export default Workout