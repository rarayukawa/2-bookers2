$(function() {
  return $('#user_postcode').jpostal({
    postcode: ['#user_postcode'],
    address: {
      '#user_prefrcture_code': '%3',
      '#user_address_city': '%4',
      '#user_ddress_streer': '%5%6%7',
    },
  });
});