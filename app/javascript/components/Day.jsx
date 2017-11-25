import React, { Component } from 'react';
import DayForm from './Dayform'
import ItemList from './Itemlist'
import 'babel-polyfill';

class Day extends Component {

  constructor(props){
    super(props);
    this.state = {
      selected: [],
    }
  this.handleClick = this.handleClick.bind(this)
  }

  handleClick(i){
    this.state.selected.push(this.props.exercises[i])
    this.setState({
      selected: this.state.selected
    })
  
  }

  render(){
    return <div className="grid">
        <div className="day-list col col-3-of-4">
          <DayForm selected = { this.state.selected } />
        </div>
        <div className="exercise-list col col-1-of-4">
          <ItemList items = { this.props.exercises } handleClick = { this.handleClick } /> 
        </div>
      </div>
  }
}

export default Day