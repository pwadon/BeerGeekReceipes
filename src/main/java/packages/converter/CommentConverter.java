package packages.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import packages.entity.Comment;
import packages.repository.CommentRepository;

public class CommentConverter implements Converter<String, Comment> {

    @Autowired
    private CommentRepository commentRepository;

    @Override
    public Comment convert(String s) {
        return commentRepository.findOne(Long.parseLong(s));
    }
}
