FactoryGirl.define do
    factory :user do
        first_name "admin"
        last_name "adminuser"
        email "admin@user.net"
        password {"YPYP929292"}
        password_confirmation {"YPYP929292"}
    end
end
