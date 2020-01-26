import React from 'react';
import { Header } from '../components/layout/Layout';
import { Logo } from 'images/logo.png';

export default function PageLayout() {
    return (
        <>
            <Header>
                <img src={Logo}></img>
                <h1>MSOE Student Government Website Editor</h1>
            </Header>
        </>
    );
}