package com.attractor.job_search.service.impl;

import com.attractor.job_search.service.ImageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@Service
@RequiredArgsConstructor
public class ImageServiceImpl implements ImageService {

    @Override
    public String uploadAvatar(Long userId, MultipartFile file) {
        String filename = ImageService.uploadImage(file);
        log.info("Avatar uploaded successfully for user with ID: " );
        return filename;
    }

    @Override
    public ResponseEntity<?> download(String filename) {
        var response = ImageService.downloadImage(filename, MediaType.IMAGE_JPEG);
        log.info("Image downloaded successfully");
        return response;
    }
}
