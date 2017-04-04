<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}


class MyAccount extends CI_Controller
{
    function index()
    {
        $this->load->helper(['form', 'url']);
        $this->load->library('Smartyci');
        $this->load->library('session');
        $this->load->library('form_validation');
        $this->load->library('ReceiveService');

        $idUser = $this->session->all_userdata()['IdUser'];

        $userData = $this->UserModel->getUserData($idUser);
        $userOrders = $this->OrderModel->getUserOrders($idUser);
        $email = $userData->Email;

        $apiCredentials = $this->AuthenticatorModel->getApiCredentials($email);

        $soldInfo = $this->receiveservice->getSold($apiCredentials, $email);
        $cardData = $this->receiveservice->getCardData($apiCredentials, $email);

        $this->smartyci->assign("soldInfo", $soldInfo);
        $this->smartyci->assign("cardData", $cardData);
        $this->smartyci->assign("idUser", $idUser);
        $this->smartyci->assign("email", $email);
        $this->smartyci->assign("username", $userData->Username);
        $this->smartyci->assign("orders", $userOrders);

        $this->smartyci->display('MyAccountView.tpl');
    }
}
