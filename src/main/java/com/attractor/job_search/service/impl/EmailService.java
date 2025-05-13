package com.attractor.job_search.service.impl;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;

@Service
@RequiredArgsConstructor
public class EmailService {
    private final JavaMailSender javaMailSender;

    @Value("res.pswd.attractor@gmail.com")
    private String EMAIL_FROM;

    public void sendMail(String to, String content) throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setFrom(EMAIL_FROM, "Job Search Support");
        helper.setTo(to);

        String subject = "Job Search Support";
        String body = "<p>Здравствуйте,</p>"
                + "<p>Вы отправили запрос на изменение пароля.</p>"
                + "<p>Нажмите на ссылку ниже, чтобы изменить пароль:</p>"
                + "<p><a href=\"" + content + "\">Изменить пароль</a></p>"
                + "<br>"
                + "<p>Игнорируйте это сообщение, если вы не запрашивали изменение пароля</p>";
        helper.setSubject(subject);
        helper.setText(body, true);
        javaMailSender.send(message);
    }
}
