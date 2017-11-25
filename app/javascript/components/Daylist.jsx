import React, { Component } from 'react';
import {List, ListItem} from 'material-ui/List';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';

class DayList extends Component {

  constructor(props){
    super(props);
    this.state = {
      days: JSON.parse(this.props.days) || []
    }
  }

  render(){
    return(
      <MuiThemeProvider>
        <div>
          {
            this.state.days.map((day, i) => {
              return (
                <List key={i}>
                  <ListItem
                  primaryText={ day.name }
                  primaryTogglesNestedList={true}
                  nestedItems={
                    day.set_exercises.map((set_exercise, i) => {
                      return <ListItem
                        key={i}
                        primaryText={ set_exercise.exercise.name } 
                        secondaryText={ set_exercise.sets  + " sets of " +  set_exercise.reps }
                      />
                    })
                  }
                  />
                </List>
              )
            })
          }
        </div>
      </MuiThemeProvider>
    )
  }
}

export default DayList