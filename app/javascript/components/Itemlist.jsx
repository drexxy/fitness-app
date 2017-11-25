import React, { Component } from 'react';

class ItemList extends Component {

  constructor(props){
    super(props);
    
    this.state = {
      items: this.props.items || [],
    }
  }

  render(){
    return(
      <ol>
        {
          this.state.items.map((item, i) => {
            return <li key={i} onClick={() => this.props.handleClick(i) } >{ item.name }</li>
          })
        }
      </ol>
    )
  }

}

export default ItemList