// 共用头部组件

import React,{ Component } from 'react';
import { Layout,Menu } from 'antd';
import PropTypes from 'prop-types';
import '../assets/style/head.scss'
import { connect } from 'react-redux';
import { compose } from 'redux';
import action from '../redux/center.redux/action';
const { Header, Footer, Sider, Content } = Layout;
const enhance = compose(
    connect(
        state => state.center_reducer,
        {
            ...action
        }
    )
);
@enhance
export default class Heade extends Component{
    static contextTypes = {
        router: PropTypes.object
    }
    constructor(props){
        super(props);
        this.state={
            index:0
        }
        this.loginOut = this.loginOut.bind(this)
    }
    handelMoudle(num){
        // this.setState({
        //     index:num
        // });
        this.props.changeModule(num)
    }
    loginOut(){
        window.localStorage.removeItem('lin_name');
        this.context.router.history.push('/center')
    }
    render(){
        //const { index } = this.state;
        const { center_moudle_index } = this.props;
        return(
            <div className="head_box clearfix">
                <div className="logo fl">我是logo</div>
                <ul className="Menu_box fl clearfix">
                    <li className={center_moudle_index===0?'fl active':'fl'} onClick={()=>this.handelMoudle(0)}>数据分析</li>
                    <li className={center_moudle_index===1?'fl active':'fl'} onClick={()=>this.handelMoudle(1)}>交易信息</li>
                </ul>
                <div className="cleafix fr">
                    <div className="fl head_img">
                        <img src="" alt="头像" width="60" />
                    </div>
                    <div onClick={this.loginOut} className="login_out fl">退出</div>
                </div>
            </div>
        )
    }
}