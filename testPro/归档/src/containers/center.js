import React,{Component,PropTypes} from 'react';
import { connect } from 'react-redux';
import { compose } from 'redux';
import Analysis from './analysis';
import Transaction from './transaction';
import action from '../redux/center.redux/action';
import '../assets/style/center.scss'
const enhance = compose(
    connect(
        state => state.center_reducer,
        {
            ...action
        }
    )
);
@enhance
export default class Center extends Component{
    constructor(props){
        super(props);
        this.state = {
            test:0
        }
    }
    componentDidMount(){
        let ele = this.refs.center;
        ele.style.minHeight = document.body.clientHeight - 66 - 69 +'px';
        window.onresize = ()=>{
            ele.style.minHeight = document.body.clientHeight - 66 - 69 +'px'
        }
    }
    componentWillReceiveProps(nextProps){
        //console.log(this.props)
    }
    renderWhat(flag){
        if(flag===0){
            return <Analysis />
        }else{
            return <Transaction />
        }
    }
    render(){
        const {test} = this.state;
        const { center_moudle_index } = this.props;
        return(
            <div ref="center" className="con_mudle" style={{minHeight:'200px'}}>
                {
                    this.renderWhat(center_moudle_index)
                } 
            </div>
        )
    }
}
