function [outputdata] = FixChange(inputdata, IDScale, ODScale, InsertZero)
    %% title ��λ����
    % inputdata : ��������, double�����з�����
    % IDScale   : ��������λ��
    % ODScale   : �������λ��
    % InsertZero: 1->ĩβ����, 0->ĩβ������
    % outputdata: �������, double�����з�����
    
    %% 
    if inputdata == 0
        outputdata = 0;
    else
        if inputdata < 0
            data_bin = dec2bin(inputdata + 2^IDScale, IDScale);
        else
            data_bin = dec2bin(inputdata, IDScale);
        end 
%         disp(data_bin);
        
        % ��λ
        if InsertZero && IDScale > ODScale
            data_scale = data_bin;
            for i = ODScale+1:IDScale
                data_scale(i) = '0';
            end
        else 
            data_scale = data_bin(1:ODScale);
        end
%         disp(data_scale);
        
        data_dec = bin2dec(data_scale);
        if InsertZero
            if data_dec < 2^(IDScale-1)
                outputdata = data_dec;
            else 
                outputdata = data_dec - 2^IDScale;
            end 
        else
            if data_dec < 2^(ODScale-1)
                outputdata = data_dec;
            else 
                outputdata = data_dec - 2^ODScale;
            end 
        end
    end 
end

