// 共用底部组件

import React,{ Component } from 'react';
import { Layout } from 'antd';

const {  Footer  } = Layout;
export default class Foot extends Component{
    constructor(props){
        super(props);
        this.state = {
            year:new Date().getFullYear(),
            style:`{}`
        }
    }
    render(){
        const { year,style } = this.state
        return(
            <Footer>
                <div style={{textAlign:"center",color:"#000"}}>
                    <a style={{color:"#000"}} href="http://www.miitbeian.gov.cn/">豫ICP备17000639号-1</a> ©{year} Dr丶net . All Rights Reserved.
                </div>
            </Footer>
        )
    }
}