function MatlabSendMailGeneral(subject, content, TargetAddress, Attachments,SourceAddress,password)
%% by LiYang_faruto
% Email:farutoliyang@foxmail.com
% 2015/05/01
%% �����������
if nargin < 6 || isempty(password)
    str = ['�����뷢���ʼ�����������'];
    disp(str);
    return;
end
if nargin < 5 || isempty(SourceAddress)
    str = ['�����뷢���ʼ��������ַ'];
    disp(str);
    return;
end
if nargin < 4
    Attachments = [];
end
if nargin < 3 || isempty(TargetAddress)
    TargetAddress = SourceAddress;
end
if nargin < 2 || isempty(content)
    content = 'contentTest(FromMatlab)';
end
if nargin < 1 || isempty(subject)
    subject = 'subjectTest(FromMatlab)';
end

%% SMTP_Server Get
ind = find( SourceAddress == '@', 1);
temp = SourceAddress(ind+1:end);

FieldName = temp;
SMTP_Server = ['smtp.',FieldName];

% ind = find( temp == '.', 1 );
% FieldName = temp(1:ind-1);
% if strcmpi(FieldName, 'foxmail')
%     FieldName = 'qq';
% end
% SMTP_Server = ['smtp.',FieldName,'.com'];

str = ['SMTP_Server=',SMTP_Server];
disp(str);
disp('���������ʼ����������ʼ����ɹ������ֶ��޸Ĵ������SMTP_Server');
%% �����ʼ�
try
    setpref('Internet','SMTP_Server',SMTP_Server);%SMTP����������סҪ�ĳ��Լ������smtp���ٶ�һ�¾����ˣ�
    setpref('Internet','E_mail',SourceAddress);
    setpref('Internet','SMTP_Username',SourceAddress);
    setpref('Internet','SMTP_Password',password);
    
    props = java.lang.System.getProperties;
    props.setProperty('mail.smtp.auth','true');
    
    if isempty(Attachments)
        sendmail(TargetAddress, subject, content);
    else
        sendmail(TargetAddress, subject, content, Attachments);
    end
catch err
    str = ['�����쳣'];
    disp(str);
    for i = 1:size(err.stack,1)
        StrTemp = ['FunName��',err.stack(i).name,' Line��',num2str(err.stack(i).line)];
        disp(StrTemp);
    end
    
%     str = ['SMTP_Server=',SMTP_Server];
%     disp(str);
%     disp('�������ʼ����ɹ������ֶ��޸Ĵ������SMTP_Server');
end

%%
disp('�ʼ�������ϣ�');
DateTimedemo = datestr(now,'yyyy-mm-dd HH:MM:SS')
