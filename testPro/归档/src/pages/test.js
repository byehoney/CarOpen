import React,{ Component } from 'react';
import C from './c'
import moduleCss from './test.module.scss'
console.log(moduleCss)
export default class T extends Component{
    constructor(props){
        super(props);
        this.state = {
            num:0
        }
    }
    componentDidMount() {
        let ele = this.refs.btn,val = this.refs.input.value;
        ele.onclick = ()=>{
            this.setState({
                num:val++
            })
        }

    }

    render(){
        let { num } = this.state;
        return(
            <div className={moduleCss.title}>
                <div className={moduleCss.test}>1111</div>
                <input ref="input" type="text"/>
                <button ref ="btn">add</button>
                 <C num = {num}/>
            </div>
        )
    }
}
