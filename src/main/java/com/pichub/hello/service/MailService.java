package com.pichub.hello.service;

import java.io.File;
import java.util.List;

public interface MailService {
    void sendSimpleMail(String to,String title,String content);
    void sendAttachmentsMail(String to, String title, String cotent, List<File> fileList);

}
